import numpy as np
from scipy import stats

# A/B Test Function
def ab_test(control, treatment, alpha=0.05):
    """ Performs an A/B test between control and treatment groups."""
    control = np.array(control)
    treatment = np.array(treatment)

    # 1. Normality check (Shapiro-Wilk)
    p_control = stats.shapiro(control).pvalue
    p_treatment = stats.shapiro(treatment).pvalue

    normal = (p_control > alpha) and (p_treatment > alpha)

    # 2. Select test
    if normal:
        statistic, p_value = stats.ttest_ind(treatment, control)

        # Cohen's d
        pooled_sd = np.sqrt(
            ((len(control)-1)*np.var(control, ddof=1) +
             (len(treatment)-1)*np.var(treatment, ddof=1))
            / (len(control)+len(treatment)-2)
        )
        effect_size = (np.mean(treatment) - np.mean(control)) / pooled_sd

        # Confidence Interval
        diff = np.mean(treatment) - np.mean(control)

        se = np.sqrt(
            np.var(control, ddof=1)/len(control) +
            np.var(treatment, ddof=1)/len(treatment)
        )

        df = len(control) + len(treatment) - 2
        t_critical = stats.t.ppf(0.975, df)

        ci_95 = (
            diff - t_critical*se,
            diff + t_critical*se
        )

    else:
        statistic, p_value = stats.mannwhitneyu(treatment, control)

        # Median difference as simple effect size
        effect_size = np.median(treatment) - np.median(control)

        ci_95 = None   # CI not standard for Mann-Whitney

    # 3. Decision
    reject_H0 = p_value < alpha

    return {
        'statistic': statistic,
        'p_value': p_value,
        'reject_H0': reject_H0,
        'effect_size': effect_size,
        'ci_95': ci_95
    }

control = np.random.normal(500, 80, 50)
treatment = np.random.normal(540, 85, 50)

result = ab_test(control, treatment)
print(result)
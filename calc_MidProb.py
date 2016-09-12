from scipy.stats import poisson


def calc_P(i):
    P = 0
    # N is the truncation number of Poisson
    N = int(poisson.ppf(1 - 1e-9, i))
    for j in range(2, N):
        for k in range(j, N):
            P += 6 * poisson.pmf(k - j, i) * poisson.pmf(k, i) * poisson.pmf(k - int(j/2), i)
            # just to follow the usage in Yu's code,
            # I add int in poisson.pmf(k - int(j/2), i),
            # do we really need to round the number?
            if j % 2 == 1:
                P += 6 * poisson.pmf(k - j, i) * poisson.pmf(k, i) * poisson.pmf(k - int(j/2) - 1, i)
    return P


lamMax = 26
P = [calc_P(i) for i in range(1, lamMax)]

# Write mid probability to txt
P_to_txt = [[lam, P[lam - 1]] for lam in range(1, lamMax)]
output_dir = "../outputs/"
with open(output_dir + "MidProb.txt", 'w') as f:
    for item in P_to_txt:
        f.write('\t'.join(map(repr, item)) + '\n')

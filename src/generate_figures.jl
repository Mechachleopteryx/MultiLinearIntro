push!(LOAD_PATH, "/Users/anthony/Dropbox/AmesHousePrices/")
using Plots, Regressors, LaTeXStrings
pyplot()
import DataFrames: readtable, DataFrame

df=readtable("credit.csv")
s=convert(Array,df[1])
d=convert(Array,df[2])
r=convert(Array,df[3])

X = DataFrame()
X[:s] = s
m1 = LinearRegressor(X,r)

r1 = predict(m1,X)
scatter(s, r, label="data")
plot!(xlab=L"Salary, $S$ (dollars)", ylab=L"Annual Return, $R$ (dollars)")
plot!(s, r1, label="linear model")
savefig("model1.png")

X = DataFrame()
X[:d] = d
m1 = LinearRegressor(X,r)

r2 = predict(m1,X)
scatter(d, r, label="data")
plot!(xlab=L"Debt, $D$ (dollars)", ylab=L"Annual Return, $R$ (dollars)")
plot!(d, r2, label="linear model")
savefig("model2.png")

f(s, d) = 750 + 0.02*d - 0.04*s
srange = linspace(minimum(s), maximum(s), 30)
drange = linspace(minimum(d), maximum(d), 30)
plot(srange, drange, f, seriestype=:wireframe, color=:orange)
scatter!(s,d,r, color=:blue, label="data")
plot!(xlab=L"Salary, $S$", ylab=L"Debt, $D$", zlab=L"Annual Return, $R$")

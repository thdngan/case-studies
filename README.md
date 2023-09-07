# Case Studies for my Numerical Methods course

Below are the backgrounds for the cases that I find interesting.

## Estimating Heat Transfer of a lake

The grouping of something into various categories is known as stratification. When two kinds of steam that are at different temperatures come into contact, thermal stratification happens. The warmer, lighter water may float above the colder water because of the difference in temperature between them, which causes the heavier, colder water to sink to the bottom. Summertime thermal stratification is a phenomenon in temperate zone lakes. The warm, buoyant surface water is on top of the cooler, denser bottom water, as seen in the figure below. The *epilimnion* and the *hypolimnion*, which are separated by a plane known as the *thermoline*, are the two layers that are effectively separated vertically as a result of this stratification.

![[images/case studies/spline_heattransfer/temperaturevsdepth.jpg]]

For environmental engineers researching the contamination of such systems, thermal stratification is of major importance. Particularly, mixing between the two levels is significantly reduced by the thermocline. Decomposition of organic debris can therefore cause a serious reduction in oxygen levels in the secluded bottom waters.

The temperature-depth curve's inflection point can be used to determine the thermocline's position - that is, the point at which $d^2T/dx^2=0$. Additionally, it is the point where the first derivative's or gradient's absolute value is at its highest. In this case study, the thermocline depth for Platte Lake and the gradient's magnitude will be calculated using cubic splines.


## Greenhouse gases and rainwater

Several greenhouse gases have shown an increase in atmospheric concentration during the past 50 years, as is widely known. Let's examine the information on carbon dioxide partial pressure ($CO_2$) that was acquired at Mauna Loa, Hawaii, from 1958 to 2003. A quadratic polynomial may be used to fit the data trend neatly,
$$p_{CO_2} = 0.011825(t - 1980.5)^2+1.356975(t-1980.5) + 339$$
where $p_{CO_2}$ is the atmospheric $CO_2$ partial pressure (ppm). According to the data, $CO_2$ levels increased by more than 19% from 315 to 376 ppm.

In addition to contributing to global warming, greenhouse gases may alter the chemistry of the atmosphere. How the rise in carbon dioxide is influencing rainwater's pH is one issue we can solve. It is generally known that carbon dioxide is the main factor of the pH of the rain outside of urban and industrial regions. The activity of hydrogen ions, and hence the acidity of a solution, are measured by pH. It may be calculated as follows for diluted aqueous solutions:

$$pH = -log_{10}[H^+]\tag*{(1)}$$
where $[H^+]$ is the molar concentration of hydrogen ions.

The chemistry of rainfall is governed by the following five nonlinear systems of equations:

$$K_1 = 10^6\dfrac{[H^+][HCO_3^-]}{p_{CO_2}K_H}\tag*{(2)}$$
$$K_2 = \dfrac{[H^+][CO_3^{2-}]}{[HCO_3^-]}\tag*{(3)}$$
$$K_w = [H^+][OH^-]\tag*{(4)}$$
$$c_T = \dfrac{p_{CO_2}K_H}{10^6} + [HCO_3^-] + [CO_3^{2-}]\tag*{(5)}$$
$$[HCO_3^-] + 2[CO_3^{2-}] + [OH^-] - [H^+] = 0\tag*{(6)}$$
where $K_1$, $K_2$ and $K_w$ are equilibrium coefficients, and $K_H$ is Henry's constant. The five unknown values are $c_T$ - total inorganic carbon, $[HCO_3^-]$ - bicarbonate, $[CO_3^{2-}]$ - carbonate, $[H^+]$ - hydrogen ion, and $[OH^-]$ - hydroxyl ion. Keep in mind that equations (2) and (5) both display the partial pressure of $CO_2$.

Now, we will apply these equations to determine the pH of rainwater given that $K_H=10^{-1.46}$, $K_1=10^{-6.3}$, $K_2=10^{-10.3}$, and $K_w=10^{-14}$. Then we will compare the results in 1958 when $p_{CO_2}=315[ppm]$ and in 2003 when $p_{CO_2}=375 [ppm]$.

Additionally, there are two criteria for choosing a numerical method for computation:
- You can be certain that rain in pristine places always ranges in pH from 2 to 12.
- You are also informed that the precision of your pH measurements is just two decimal places.

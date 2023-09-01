/* Rachel Koerner's Answers for PMG SQL Assessment */

/*
1. Sum of Impressions by Day
*/

SELECT date, SUM(impressions)
FROM marketing_performance
GROUP BY date;


/*
2. Top Three Revenue-Generating States in Order of Best to Worst
*/

SELECT state, SUM(revenue) AS state_revenue
FROM website_revenue
GROUP BY state
ORDER BY state_revenue DESC
LIMIT 3;

/*The third best state is Ohio and its revenue is the value of 37577.*/


/*
3. Cost, impressions, clicks, and revenue by campaign name
*/

SELECT name, ROUND(SUM(cost), 2), SUM(impressions), SUM(clicks), SUM(revenue)
FROM campaign_info
INNER JOIN website_revenue ON id = website_revenue.campaign_id
INNER JOIN marketing_performance ON id = marketing_performance.campaign_id
GROUP BY id
ORDER BY name;


/*
4. Number of conversions of Campaign5 by state
*/

SELECT campaign_info.name, website_revenue.state, SUM(conversions) FROM marketing_performance
INNER JOIN campaign_info ON campaign_info.id = marketing_performance.campaign_id
INNER JOIN website_revenue ON website_revenue.campaign_id = marketing_performance.campaign_id
WHERE campaign_info.name = "Campaign5"
GROUP BY website_revenue.state
ORDER BY SUM(conversions) DESC;

/* The state of Georgia generated the most conversions for this campaign. */


/*
5. Highest revenue by campaign
*/

SELECt campaign_info.name, SUM(revenue) - SUM(marketing_performance.cost)
FROM website_revenue
INNER JOIN campaign_info ON campaign_info.id =  website_revenue.campaign_id
INNER JOIN marketing_performance ON marketing_performance.campaign_id =  website_revenue.campaign_id
GROUP BY website_revenue.campaign_id
ORDER BY campaign_info.name;

/*Since the point of a marketing campaign is to reach viewership to increase profit,
I determined that the campaigns with the highest profit (revenue - cost) are most
successful. In this instance, Campaign 3 had the most profit and is therefore most efficient.*/

/*
6. Best day of week
*/

SELECt WEEKDAY(website_revenue.date), SUM(revenue) - SUM(marketing_performance.cost)
FROM website_revenue
INNER JOIN campaign_info ON campaign_info.id =  website_revenue.campaign_id
INNER JOIN marketing_performance ON marketing_performance.campaign_id =  website_revenue.campaign_id
GROUP BY WEEKDAY(website_revenue.date)
ORDER BY  SUM(revenue) - SUM(marketing_performance.cost);

/*Again the best day of the week was deemed to be determined by profit.*/
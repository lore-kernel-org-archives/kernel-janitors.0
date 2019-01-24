From: Tero Kristo <t-kristo@ti.com>
Date: Thu, 24 Jan 2019 19:50:33 +0000
Subject: Re: [PATCH v2] clk: ti: Fix error handling in ti_clk_parse_divider_data()
Message-Id: <2d7a3290-44b3-94ad-076e-fda869480edf@ti.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190115194625.GA1074@kadam>
 <154835786296.136743.12154336975596919287@swboyd.mtv.corp.google.com>
In-Reply-To: <154835786296.136743.12154336975596919287@swboyd.mtv.corp.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Stephen Boyd <sboyd@kernel.org>, Dan Carpenter <dan.carpenter@oracle.com>
Cc: Michael Turquette <mturquette@baylibre.com>, linux-omap@vger.kernel.org, linux-clk@vger.kernel.org, kernel-janitors@vger.kernel.org

On 24/01/2019 21:24, Stephen Boyd wrote:
> Quoting Dan Carpenter (2019-01-15 11:46:25)
>> The ti_clk_parse_divider_data() function is only called from
>> _get_div_table_from_setup().  That function doesn't look at the return
>> value but instead looks at the "*table" pointer.  In this case, if the
>> kcalloc() fails then *table is NULL (which means success).  It should
>> instead be an error pointer.
>>
>> The ti_clk_parse_divider_data() function has two callers.  One checks
>> for errors and the other doesn't.  I have fixed it so now both handle
>> errors.
>>
>> Fixes: 4f6be5655dc9 ("clk: ti: divider: add driver internal API for parsing divider data")
>> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>> ---
> 
> Applied to clk-fixes
> 
> I'm going to add Tero's ack to this because it isn't really that
> different.
> 

Yeah, thats ok. Thanks Stephen.

-Tero
--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

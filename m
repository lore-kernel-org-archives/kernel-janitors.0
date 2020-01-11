From: Wen Yang <wenyang@linux.alibaba.com>
Date: Sat, 11 Jan 2020 05:06:34 +0000
Subject: Re: [PATCH v3] coccinelle: semantic patch to check for inappropriate do_div() calls
Message-Id: <c4ada2f2-19b0-91ef-ddf3-a1999f4209ea@linux.alibaba.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200110131526.60180-1-wenyang@linux.alibaba.com>
 <91abb141-57b8-7659-25ec-8080e290d846@web.de>
In-Reply-To: <91abb141-57b8-7659-25ec-8080e290d846@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Markus Elfring <Markus.Elfring@web.de>, cocci@systeme.lip6.fr, kernel-janitors@vger.kernel.org
Cc: Michal Marek <michal.lkml@markovi.net>, Julia Lawall <Julia.Lawall@lip6.fr>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Nicolas Palix <nicolas.palix@imag.fr>, Gilles Muller <Gilles.Muller@lip6.fr>, =?UTF-8?Q?Matthias_M=c3=a4nnich?= <maennich@google.com>, linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>



On 2020/1/11 12:35 上午, Markus Elfring wrote:
>> +@initialize:python@
> …
>> +def filter_out_safe_constants(str):
> …
>> +def construct_warnings(str, suggested_fun):
> 
> * I suggest once more to adjust the dependency specifications for the usage
>    of these functions by SmPL rules.
> 

Most of the functions here are for all operation modes.


> * Can the local variable “msg” be omitted?
> 
> 
>> +coccilib.org.print_todo(p[0], construct_warnings("div64_ul"))
> 
> I suggest again to move the prefix “div64_” into the string literal
> of the function implementation.
> 

“div64_ul” indicates the function name we recommend.
As shown in the patch:

+def construct_warnings(suggested_fun):
+    msg="WARNING: do_div() does a 64-by-32 division, please consider 
using %s instead."
+    return  msg % suggested_fun
...
+coccilib.org.print_todo(p[0], construct_warnings("div64_ul"))

If we delete the prefix "div64_", it may reduce readability.

> 
> The SmPL code for two disjunctions could become shorter.
> 

You may suggest to modify it as follows:
+@@
+*do_div(f, \( l \| ul \| ul64 \| sl64 \) );

We agree with Julia:
I don't se any point to this.  The code matched will be the same in both
cases.  The original code is quite readable, without the ugly \( etc.

--
Regards，
Wen

> Regards,
> Markus
> 

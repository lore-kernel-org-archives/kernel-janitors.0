From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 17 Oct 2016 11:30:59 +0000
Subject: Re: ARM64-cpuinfo: Combine six calls for sequence output into one seq_printf() call in c_show()
Message-Id: <a09542e6-9851-45ef-583d-338205217cfc@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <83d98772-8872-1b75-a9a5-5f08b8462e18@users.sourceforge.net>
 <20161017105605.GB29095@leverpostej>
In-Reply-To: <20161017105605.GB29095@leverpostej>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

>> Some data were printed into a sequence by six separate function calls.
>> Print the same data by a single function call instead.
> 
> ... why?
> 
> Beyond simply having fewer function calls, is there an upside?

Will it matter to improve run time characteristics at this source code place?


> This makes it harder to see the relationship between the format strings
> and their associated data, and makes the code longer.

Do you prefer an other layout for the passed data so that the increase
of line count in my update suggestion would look differently?

Regards,
Markus

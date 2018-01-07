From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 07 Jan 2018 08:19:17 +0000
Subject: Re: atm/clip: Use seq_puts() in svc_addr()
Message-Id: <a42edf4b-92c7-469d-dab1-3238cd7487bd@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <97636808-1d9f-d196-ebce-fbd2505c50e2@users.sourceforge.net>
 <20180106232539.5d6bb620@elisabeth>
In-Reply-To: <20180106232539.5d6bb620@elisabeth>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Stefano Brivio <sbrivio@redhat.com>, netdev@vger.kernel.org
Cc: Bhumika Goyal <bhumirks@gmail.com>, "David S. Miller" <davem@davemloft.net>, David Windsor <dwindsor@gmail.com>, Elena Reshetova <elena.reshetova@intel.com>, Hans Liljestrand <ishkamiel@gmail.com>, Johannes Berg <johannes.berg@intel.com>, Kees Cook <keescook@chromium.org>, Roopa Prabhu <roopa@cumulusnetworks.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

>> Two strings should be quickly put into a sequence by two function calls.
>> Thus use the function "seq_puts" instead of "seq_printf".
>>
>> This issue was detected by using the Coccinelle software.
> 
> Can you please explain what the issue really is and what you're trying
> to do here?

Is the function "seq_puts" a bit more efficient for the desired output
of a single string in comparison to calling the function "seq_printf"
for this purpose?


> One shouldn't need to dig into Coccinelle patterns to find
> out what you mean,

Why did an attribution for a software tool confuse you?


> and "strings should be quickly put into a sequence"
> isn't terribly helpful.

Which wording would you find more appropriate for the suggested
adjustment of these function calls?

Regards,
Markus

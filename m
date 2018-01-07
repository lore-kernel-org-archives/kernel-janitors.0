From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 07 Jan 2018 16:30:12 +0000
Subject: Re: atm/clip: Use seq_puts() in svc_addr()
Message-Id: <c6ab8967-ec45-2bfb-9212-9db42562be81@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <97636808-1d9f-d196-ebce-fbd2505c50e2@users.sourceforge.net>
 <20180106232539.5d6bb620@elisabeth>
 <a42edf4b-92c7-469d-dab1-3238cd7487bd@users.sourceforge.net>
 <20180107163008.4ddd0c79@elisabeth>
In-Reply-To: <20180107163008.4ddd0c79@elisabeth>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Stefano Brivio <sbrivio@redhat.com>, netdev@vger.kernel.org
Cc: Bhumika Goyal <bhumirks@gmail.com>, "David S. Miller" <davem@davemloft.net>, David Windsor <dwindsor@gmail.com>, Elena Reshetova <elena.reshetova@intel.com>, Hans Liljestrand <ishkamiel@gmail.com>, Johannes Berg <johannes.berg@intel.com>, Kees Cook <keescook@chromium.org>, Roopa Prabhu <roopa@cumulusnetworks.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

>> Is the function "seq_puts" a bit more efficient for the desired output
>> of a single string in comparison to calling the function "seq_printf"
>> for this purpose?
> 
> Will you please be so kind and tell us?

How do you think about to get the run time characteristics for these
sequence output functions better documented?
https://elixir.free-electrons.com/linux/v4.15-rc6/source/fs/seq_file.c#L660

Can an information like “WARNING: Prefer seq_puts to seq_printf”
(from the script “checkpatch.pl”) be another incentive?


>>> and "strings should be quickly put into a sequence"
>>> isn't terribly helpful.  
>>
>> Which wording would you find more appropriate for the suggested
>> adjustment of these function calls?
> 
> Whatever describes the actual issue and what you're doing about it.
> Turn your rhetorical question above into a commit message, done.
> 
> Compare that with your original commit message, on the other hand,
> and you should understand what I mean.

Which descriptions are you really missing for the affected data output?

Regards,
Markus

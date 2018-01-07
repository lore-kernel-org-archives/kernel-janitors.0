From: Stefano Brivio <sbrivio@redhat.com>
Date: Sun, 07 Jan 2018 15:30:08 +0000
Subject: Re: atm/clip: Use seq_puts() in svc_addr()
Message-Id: <20180107163008.4ddd0c79@elisabeth>
List-Id: <kernel-janitors.vger.kernel.org>
References: <97636808-1d9f-d196-ebce-fbd2505c50e2@users.sourceforge.net>
        <20180106232539.5d6bb620@elisabeth>
        <a42edf4b-92c7-469d-dab1-3238cd7487bd@users.sourceforge.net>
In-Reply-To: <a42edf4b-92c7-469d-dab1-3238cd7487bd@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: netdev@vger.kernel.org, Bhumika Goyal <bhumirks@gmail.com>, "David S. Miller" <davem@davemloft.net>, David Windsor <dwindsor@gmail.com>, Elena Reshetova <elena.reshetova@intel.com>, Hans Liljestrand <ishkamiel@gmail.com>, Johannes Berg <johannes.berg@intel.com>, Kees Cook <keescook@chromium.org>, Roopa Prabhu <roopa@cumulusnetworks.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Sun, 7 Jan 2018 09:19:17 +0100
SF Markus Elfring <elfring@users.sourceforge.net> wrote:

> >> Two strings should be quickly put into a sequence by two function calls.
> >> Thus use the function "seq_puts" instead of "seq_printf".
> >>
> >> This issue was detected by using the Coccinelle software.  
> > 
> > Can you please explain what the issue really is and what you're trying
> > to do here?  
> 
> Is the function "seq_puts" a bit more efficient for the desired output
> of a single string in comparison to calling the function "seq_printf"
> for this purpose?

Will you please be so kind and tell us?

> > One shouldn't need to dig into Coccinelle patterns to find
> > out what you mean,  
> 
> Why did an attribution for a software tool confuse you?

I'm not confused. I'm saying that one shouldn't need to dig into
Coccinelle patterns to find out what you mean.

> > and "strings should be quickly put into a sequence"
> > isn't terribly helpful.  
> 
> Which wording would you find more appropriate for the suggested
> adjustment of these function calls?

Whatever describes the actual issue and what you're doing about it.
Turn your rhetorical question above into a commit message, done.

Compare that with your original commit message, on the other hand,
and you should understand what I mean.

-- 
Stefano

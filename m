From: Stefano Brivio <sbrivio@redhat.com>
Date: Sat, 06 Jan 2018 22:25:39 +0000
Subject: Re: [PATCH] atm/clip: Use seq_puts() in svc_addr()
Message-Id: <20180106232539.5d6bb620@elisabeth>
List-Id: <kernel-janitors.vger.kernel.org>
References: <97636808-1d9f-d196-ebce-fbd2505c50e2@users.sourceforge.net>
In-Reply-To: <97636808-1d9f-d196-ebce-fbd2505c50e2@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: netdev@vger.kernel.org, Bhumika Goyal <bhumirks@gmail.com>, "David S. Miller" <davem@davemloft.net>, David Windsor <dwindsor@gmail.com>, Elena Reshetova <elena.reshetova@intel.com>, Hans Liljestrand <ishkamiel@gmail.com>, Johannes Berg <johannes.berg@intel.com>, Kees Cook <keescook@chromium.org>, Roopa Prabhu <roopa@cumulusnetworks.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Sat, 6 Jan 2018 22:44:08 +0100
SF Markus Elfring <elfring@users.sourceforge.net> wrote:

> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Sat, 6 Jan 2018 22:34:12 +0100
> 
> Two strings should be quickly put into a sequence by two function calls.
> Thus use the function "seq_puts" instead of "seq_printf".
>
> This issue was detected by using the Coccinelle software.

Can you please explain what the issue really is and what you're trying
to do here? One shouldn't need to dig into Coccinelle patterns to find
out what you mean, and "strings should be quickly put into a sequence"
isn't terribly helpful.

-- 
Stefano

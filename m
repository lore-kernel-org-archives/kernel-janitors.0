From: Kees Cook <keescook@chromium.org>
Date: Tue, 23 May 2017 04:32:27 +0000
Subject: Re: [PATCH 0/5] atm: Adjustments for some function implementations
Message-Id: <CAGXu5jLGuH5-dkGd9_JFWAWHUSkubweb-WxD305=n3TORs3-uA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <49543220-93e4-781c-877b-381277837152@users.sourceforge.net>
In-Reply-To: <49543220-93e4-781c-877b-381277837152@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: Network Development <netdev@vger.kernel.org>, Augusto Mecking Caringi <augustocaringi@gmail.com>, "David S. Miller" <davem@davemloft.net>, Jarod Wilson <jarod@redhat.com>, Javier Martinez Canillas <javier@osg.samsung.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Sun, May 21, 2017 at 1:12 PM, SF Markus Elfring
<elfring@users.sourceforge.net> wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Sun, 21 May 2017 22:09:11 +0200
>
> A few update suggestions were taken into account
> from static source code analysis.
>
> Markus Elfring (5):
>   Improve a size determination in four functions
>   Delete an error message for a failed memory allocation in make_entry()
>   Adjust 19 checks for null pointers
>   Use seq_puts() in lec_info()
>   Use seq_putc() in lec_info()
>
>  net/atm/lec.c | 55 +++++++++++++++++++++++++++----------------------------
>  1 file changed, 27 insertions(+), 28 deletions(-)

These all look fine to me. Thanks!

Reviewed-by: Kees Cook <keescook@chromium.org>

-Kees

-- 
Kees Cook
Pixel Security

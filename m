From: Julian Calaby <julian.calaby@gmail.com>
Date: Sun, 04 Sep 2016 03:24:47 +0000
Subject: Re: [PATCH 2/2] mwifiex: simplify length computation for some memset
Message-Id: <CAGRGNgUP5VmTLzQfT99BqmRO9eKW9Du5e3O7DpdX-rByFSEmEA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1470641940-26681-1-git-send-email-christophe.jaillet@wanadoo.fr>
In-Reply-To: <1470641940-26681-1-git-send-email-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Amitkumar Karwar <akarwar@marvell.com>, Nishant Sarmukadam <nishants@marvell.com>, linux-wireless <linux-wireless@vger.kernel.org>, netdev <netdev@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, kernel-janitors <kernel-janitors@vger.kernel.org>

Hi All,

On Mon, Aug 8, 2016 at 5:39 PM, Christophe JAILLET
<christophe.jaillet@wanadoo.fr> wrote:
> This patch should be a no-op. It just simplifies code by using the name of
> a variable instead of its type when calling 'sizeof'.
>
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Reviewed-by: Julian Calaby <julian.calaby@gmail.com>

Thanks,

-- 
Julian Calaby

Email: julian.calaby@gmail.com
Profile: http://www.google.com/profiles/julian.calaby/

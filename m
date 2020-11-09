From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 09 Nov 2020 09:46:53 +0000
Subject: Re: [PATCH] auxdisplay: fix use after free in lcd2s_i2c_remove()
Message-Id: <CANiq72m+_4K8RzR4JtdAq4o4uc_vBPmLZmgLiGB1jwd_FnjrZA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201106192415.GA2696904@mwanda>
In-Reply-To: <20201106192415.GA2696904@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Lars Poeschel <poeschel@lemonage.de>, linux-kernel <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Fri, Nov 6, 2020 at 8:26 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> The kfree() needs to be moved down a line to prevent a use after free.

Thanks Dan for catching this one up while in -next. I'll pick it up.

Cheers,
Miguel

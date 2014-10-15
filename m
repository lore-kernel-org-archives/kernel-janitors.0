From: Stanislav Yakovlev <stas.yakovlev@gmail.com>
Date: Wed, 15 Oct 2014 20:52:27 +0000
Subject: Re: [patch 2/2] ipw2x00: clean up a condition
Message-Id: <CA++WF2N4v20EqEaH-DnKAEzn4PwHWQHBEq6=Uthf7TsRZpimEg@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20141009095939.GB20875@mwanda>
In-Reply-To: <20141009095939.GB20875@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: "John W. Linville" <linville@tuxdriver.com>, wireless <linux-wireless@vger.kernel.org>, kernel-janitors@vger.kernel.org

Hello Dan,

On 9 October 2014 02:59, Dan Carpenter <dan.carpenter@oracle.com> wrote:
> The original condition was "(PAGE_SIZE - len)" when "(len < PAGE_SIZE)"
> is intended.
>
> This condition is not really sufficient, but also not really needed...
> If "len > PAGE_SIZE" then it we will print a warning message in dmesg
> but there are no other effects.  Maybe we should just remove the
> condition?
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Looks fine, thanks.

Stanislav.

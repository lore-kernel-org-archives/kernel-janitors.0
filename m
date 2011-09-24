From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 24 Sep 2011 11:16:08 +0000
Subject: Re: [patch ] remove redundant const in matrix_keypad.c
Message-Id: <20110924111607.GP22994@longonot.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <CAMvewQKTJL0CdL25v7MizgJUexSmbb7E1u=9LNRu2yhdBCMROQ@mail.gmail.com>
In-Reply-To: <CAMvewQKTJL0CdL25v7MizgJUexSmbb7E1u=9LNRu2yhdBCMROQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sat, Sep 24, 2011 at 03:06:31PM +0530, Zic Rim wrote:
> SIMPLE_DEV_PM_OPS defins a const struct , no need to prefix with  const.
> 
> Signed-off-by: Navin P <zicrim@gmail.com>
> 

From: Zic Rim <zicrim@gmail.com>
Signed-off-by: Navin P <zicrim@gmail.com>

Hi hi,

Could you change your setup so that the From and Signed-off-by lines
match?  Also please you your full name (if P is your full last name
that's great of course, but I just wanted to check).

Can you CC the people from
./scripts/get_maintainer.pl -f drivers/input/keyboard/matrix_keypad.c

If there is a subsystem list (in this case linux-input), then I
normally leave out linux-kernel@vger.kernel.org.  They don't care
about janitor patches generally.  But if there isn't a subsystem
list, then do include linux-kernel.

Your email client is mangling the patch.

> 
> diff --git a/drivers/input/keyboard/matrix_keypad.c
> b/drivers/input/keyboard/matrix_keypad.c

It line wrapped this.

> index b02e426..c127658 100644
> --- a/drivers/input/keyboard/matrix_keypad.c
> +++ b/drivers/input/keyboard/matrix_keypad.c
> @@ -294,7 +294,7 @@ static int matrix_keypad_resume(struct device *dev)
>         return 0;

The tabs are changed to spaces.

>  }
> 
> -static const SIMPLE_DEV_PM_OPS(matrix_keypad_pm_ops,
> +static SIMPLE_DEV_PM_OPS(matrix_keypad_pm_ops,
>                                 matrix_keypad_suspend, matrix_keypad_resume);
>  #endif
> --

I don't know if you are using the gmail web interface, but that won't
work at all.  You'll need to set up an email client or use the git
email features.

1) Send a patch to yourself.
2) Save the raw email including headers and everything
3) cd path/to/src ; cat raw_email.txt | patch -p1

When the patch applies correctly then resend it.

Don't feel bad that your first patch got rejected for house keeping
reasons.  That's how we all started.  :)

regards,
dan carpenter

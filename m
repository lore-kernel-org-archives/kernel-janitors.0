From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 04 Jul 2017 09:51:15 +0000
Subject: Re: [PATCH] coccinelle: api: detect unnecessary le16_to_cpu
Message-Id: <CAHp75VdyurjwN+DZQuKnEzNe+XgZwiLLkc0Rg0NvFr=4D2GiQA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1498937290-12285-1-git-send-email-Julia.Lawall@lip6.fr>
 <20170703133602.ejcdu35ku3i63cj2@earth>
 <CAHp75VeJY8Xr2H8XK8A7Piu-38TnAeKu5Gn+edtkZmbw2quW0g@mail.gmail.com>
 <20170703171427.qtpodt7watymphac@earth>
 <CAHp75VeLV_ySCRN3B=MSoZdyrbXXqqEXrgC+hJCDoLLCJRComQ@mail.gmail.com>
 <20170703182033.5stv5eq33et63coh@earth>
 <alpine.DEB.2.20.1707041104390.3346@hadrien>
In-Reply-To: <alpine.DEB.2.20.1707041104390.3346@hadrien>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cocci@systeme.lip6.fr

On Tue, Jul 4, 2017 at 12:11 PM, Julia Lawall <julia.lawall@lip6.fr> wrote:
> Here is a revised version (not a patch because it doesn't support all of
> the various modes) and the results.  It doesn't return anything beyond
> what was mentioned in previous mails.
>
> For the following code:
>
>         ret = i2c_smbus_read_word_data(chip->client, reg << 1);
>         val[0] = (u16)ret & 0xFF;
>         val[1] = (u16)ret >> 8;
>
> do we want to see:
>
> put_unaligned(val,i2c_smbus_read_word_data(chip->client, reg << 1));

If and only if the type of the pointer is a byte type (u8 *, char *,
or alike) _and_ we try to use it as a provider for 16-bit value (2
bytes).

-- 
With Best Regards,
Andy Shevchenko

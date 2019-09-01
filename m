From: Paul Moore <paul@paul-moore.com>
Date: Sun, 01 Sep 2019 18:22:47 +0000
Subject: Re: [PATCH] netlabel: remove redundant assignment to pointer iter
Message-Id: <CAHC9VhRbJWO3rhk=090VAJOHsZer89s6VP_mFcMcoPHf-Zg4Kw@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190901155205.16877-1-colin.king@canonical.com>
 <CAHC9VhSVKEJ-EBAry5fVN3Ux22occGQ5jxbFBecMsR+q7+UT5A@mail.gmail.com> <de0cd774-8fce-d69a-8ea4-3c7b2ee3a918@wanadoo.fr>
In-Reply-To: <de0cd774-8fce-d69a-8ea4-3c7b2ee3a918@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Colin King <colin.king@canonical.com>, "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org, linux-security-module@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Sun, Sep 1, 2019 at 1:16 PM Christophe JAILLET
<christophe.jaillet@wanadoo.fr> wrote:
> Le 01/09/2019 à 18:04, Paul Moore a écrit :
>
> On Sun, Sep 1, 2019 at 11:52 AM Colin King <colin.king@canonical.com> wrote:
>
> From: Colin Ian King <colin.king@canonical.com>
>
> Pointer iter is being initialized with a value that is never read and
> is being re-assigned a little later on. The assignment is redundant
> and hence can be removed.
>
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  net/netlabel/netlabel_kapi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> This patch doesn't seem correct to me, at least not in current form.
> At the top of _netlbl_catmap_getnode() is a check to see if iter is
> NULL (as well as a few other checks on iter after that); this patch
> would break that code.
>
> Perhaps we can get rid of the iter/catmap assignment when we define
> iter, but I don't think this patch is the right way to do it.
>
> diff --git a/net/netlabel/netlabel_kapi.c b/net/netlabel/netlabel_kapi.c
> index 2b0ef55cf89e..409a3ae47ce2 100644
> --- a/net/netlabel/netlabel_kapi.c
> +++ b/net/netlabel/netlabel_kapi.c
> @@ -607,7 +607,7 @@ static struct netlbl_lsm_catmap *_netlbl_catmap_getnode(
>   */
>  int netlbl_catmap_walk(struct netlbl_lsm_catmap *catmap, u32 offset)
>  {
> -       struct netlbl_lsm_catmap *iter = catmap;
> +       struct netlbl_lsm_catmap *iter;
>         u32 idx;
>         u32 bit;
>         NETLBL_CATMAP_MAPTYPE bitmap;
> --
> 2.20.1
>
> 'iter' is reassigned a value between the declaration and the NULL test, so removing the fist initialisation looks good to me.

This is what I get when I try to review patches quickly while doing
other things on the weekend <sigh> ... yes, you are correct, I was
looking at _netlbl_catmap_getnode() and not netlbl_catmap_walk(); my
apologies.

-- 
paul moore
www.paul-moore.com

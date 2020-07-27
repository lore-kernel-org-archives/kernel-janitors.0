From: Mimi Zohar <zohar@kernel.org>
Date: Mon, 27 Jul 2020 20:57:56 +0000
Subject: Re: [PATCH] integrity: remove redundant initialization of variable ret
Message-Id: <1595883476.4841.167.camel@kernel.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200701134634.549399-1-colin.king@canonical.com>
         <alpine.LRH.2.21.2007280405340.18670@namei.org>
In-Reply-To: <alpine.LRH.2.21.2007280405340.18670@namei.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: James Morris <jmorris@namei.org>, Colin King <colin.king@canonical.com>, Mimi Zohar <zohar@linux.ibm.com>
Cc: "Serge E . Hallyn" <serge@hallyn.com>, linux-security-module@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, 2020-07-28 at 04:05 +1000, James Morris wrote:
> On Wed, 1 Jul 2020, Colin King wrote:
> 
> > From: Colin Ian King <colin.king@canonical.com>
> > 
> > The variable ret is being initialized with a value that is never read
> > and it is being updated later with a new value.  The initialization is
> > redundant and can be removed.
> > 
> > Addresses-Coverity: ("Unused value")
> > Signed-off-by: Colin Ian King <colin.king@canonical.com>
> > ---
> >  security/integrity/digsig_asymmetric.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/security/integrity/digsig_asymmetric.c b/security/integrity/digsig_asymmetric.c
> > index 4e0d6778277e..cfa4127d0518 100644
> > --- a/security/integrity/digsig_asymmetric.c
> > +++ b/security/integrity/digsig_asymmetric.c
> > @@ -79,7 +79,7 @@ int asymmetric_verify(struct key *keyring, const char *sig,
> >  	struct public_key_signature pks;
> >  	struct signature_v2_hdr *hdr = (struct signature_v2_hdr *)sig;
> >  	struct key *key;
> > -	int ret = -ENOMEM;
> > +	int ret;
> 
> Assuming Mimi will grab this.
> 
> 
> Acked-by: James Morris <jamorris@linux.microsoft.com>

Yes, thank you for the reminder.

Mimi

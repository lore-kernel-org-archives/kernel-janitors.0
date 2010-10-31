From: Eric Dumazet <eric.dumazet@gmail.com>
Date: Sun, 31 Oct 2010 18:08:34 +0000
Subject: Re: [PATCH 1/3] net: ax25: fix information leak to userland
Message-Id: <1288548514.2660.70.camel@edumazet-laptop>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1288545022-16393-1-git-send-email-segooon@gmail.com>
In-Reply-To: <1288545022-16393-1-git-send-email-segooon@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Vasiliy Kulikov <segooon@gmail.com>
Cc: kernel-janitors@vger.kernel.org, Joerg Reuter <jreuter@yaina.de>, Ralf Baechle <ralf@linux-mips.org>, "David S. Miller" <davem@davemloft.net>, linux-hams@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

Le dimanche 31 octobre 2010 à 20:10 +0300, Vasiliy Kulikov a écrit :
> Sometimes ax25_getname() doesn't initialize all members of fsa_digipeater
> field of fsa struct.  This structure is then copied to userland.  It leads to
> leaking of contents of kernel stack memory.  We have to initialize them to zero.
> 
> Signed-off-by: Vasiliy Kulikov <segooon@gmail.com>
> ---
>  net/ax25/af_ax25.c |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)
> 
> diff --git a/net/ax25/af_ax25.c b/net/ax25/af_ax25.c
> index 26eaebf..a324d83 100644
> --- a/net/ax25/af_ax25.c
> +++ b/net/ax25/af_ax25.c
> @@ -1392,6 +1392,7 @@ static int ax25_getname(struct socket *sock, struct sockaddr *uaddr,
>  	ax25_cb *ax25;
>  	int err = 0;
>  
> +	memset(&fsa->fsa_digipeater, 0, sizeof(fsa->fsa_digipeater));
>  	lock_sock(sk);
>  	ax25 = ax25_sk(sk);
>  

If you really want to fix this for good, please do it completely ?

sa_family_t is a short

ax25_address is 7 bytes.

Therefore, there is a hole before sax25_ndigis.

struct sockaddr_ax25 {
        sa_family_t     sax25_family;
        ax25_address    sax25_call;
<hole>
        int             sax25_ndigis;
        /* Digipeater ax25_address sets follow */
};
struct full_sockaddr_ax25 {
        struct sockaddr_ax25 fsa_ax25;
        ax25_address    fsa_digipeater[AX25_MAX_DIGIS];
};


So a correct patch is the following one. Note AX25 is probably used by
nobody at all, so a full memset() is not performance critical in this
path.


diff --git a/net/ax25/af_ax25.c b/net/ax25/af_ax25.c
index 26eaebf..6da5dae 100644
--- a/net/ax25/af_ax25.c
+++ b/net/ax25/af_ax25.c
@@ -1392,6 +1392,7 @@ static int ax25_getname(struct socket *sock, struct sockaddr *uaddr,
 	ax25_cb *ax25;
 	int err = 0;
 
+	memset(fsa, 0, sizeof(*fsa));
 	lock_sock(sk);
 	ax25 = ax25_sk(sk);
 
@@ -1403,7 +1404,6 @@ static int ax25_getname(struct socket *sock, struct sockaddr *uaddr,
 
 		fsa->fsa_ax25.sax25_family = AF_AX25;
 		fsa->fsa_ax25.sax25_call   = ax25->dest_addr;
-		fsa->fsa_ax25.sax25_ndigis = 0;
 
 		if (ax25->digipeat != NULL) {
 			ndigi = ax25->digipeat->ndigi;



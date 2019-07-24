From: Kalle Valo <kvalo@codeaurora.org>
Date: Wed, 24 Jul 2019 11:46:43 +0000
Subject: Re: [PATCH v2] libertas: Fix a double free in if_spi_c2h_data()
Message-Id: <20190724114644.65BAB60ACE@smtp.codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <ee4472e4728becc9713962ba264742cb1f337098.camel@redhat.com>
In-Reply-To: <ee4472e4728becc9713962ba264742cb1f337098.camel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Williams <dcbw@redhat.com>
Cc: Philip Rakity <prakity@yahoo.com>, libertas-dev@lists.infradead.org, kernel-janitors@vger.kernel.org, linux-wireless@vger.kernel.org, Lubomir Rintel <lkundrak@v3.sk>, Allison Randal <allison@lohutok.net>, Dan Carpenter <dan.carpenter@oracle.com>

Dan Williams <dcbw@redhat.com> wrote:

> The lbs_process_rxed_packet() frees the skb.  It didn't originally, but
> we fixed it in commit f54930f36311 ("libertas: don't leak skb on receive
> error").
> 
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> Signed-off-by: Dan Williams <dcbw@redhat.com>

Failed to compile:

drivers/net/wireless/marvell/libertas/if_spi.c: In function 'if_spi_c2h_data':
drivers/net/wireless/marvell/libertas/if_spi.c:771:11: error: expected ';' before '}' token
   goto out
           ^
           ;
  }
  ~         
make[5]: *** [drivers/net/wireless/marvell/libertas/if_spi.o] Error 1
make[4]: *** [drivers/net/wireless/marvell/libertas] Error 2
make[3]: *** [drivers/net/wireless/marvell] Error 2
make[3]: *** Waiting for unfinished jobs....
make[2]: *** [drivers/net/wireless] Error 2
make[1]: *** [drivers/net] Error 2
make[1]: *** Waiting for unfinished jobs....
make: *** [drivers] Error 2

Patch set to Changes Requested.

-- 
https://patchwork.kernel.org/patch/11033059/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

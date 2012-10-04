From: ebiederm@xmission.com (Eric W. Biederman)
Date: Thu, 04 Oct 2012 03:43:44 +0000
Subject: Re: [userns:userns-always-map-user-v64 13/68] net/bluetooth/af_bluetooth.c:598:7: warning: format '%
Message-Id: <87lifmyk9b.fsf@xmission.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20121004030820.GA18140@localhost>
In-Reply-To: <20121004030820.GA18140@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Fengguang Wu <fengguang.wu@intel.com> writes:

> Hi Eric,
>
> FYI, there are new compile warnings show up in
>
> tree:   git://git.kernel.org/pub/scm/linux/kernel/git/ebiederm/user-namespace.git userns-always-map-user-v64
> head:   8af30da8de970429970913ed15991f98c6e16e43
> commit: 60c4a95efc7d7d3c05d44e816c2767c3fbe90773 [13/68] userns: Now that everything has been converted remove the unnecessary infrastructure
> config: i386-randconfig-b111 (attached as .config)
>
> All warnings:
>
> net/bluetooth/af_bluetooth.c: In function 'bt_seq_show':
> net/bluetooth/af_bluetooth.c:598:7: warning: format '%u' expects argument of type 'unsigned int', but argument 7 has type 'kuid_t' [-Wformat]

Thanks.  This is due to an overlooked merge conflict between the
bluetooth tree and the user namespace tree.

Thanks for catching this.  This style of failure is a compile error
everywhere else and I forgot to look for extra warnings.

Eric

> vim +598 net/bluetooth/af_bluetooth.c
>
> 256a06c8 (Masatake YAMATO    2012-07-26  582) 		seq_putc(seq, '\n');
> 256a06c8 (Masatake YAMATO    2012-07-26  583) 	} else {
> 09d5d4aa (Andrei Emeltchenko 2012-08-07  584) 		struct sock *sk = sk_entry(v);
> 09d5d4aa (Andrei Emeltchenko 2012-08-07  585) 		struct bt_sock *bt = bt_sk(sk);
> 256a06c8 (Masatake YAMATO    2012-07-26  586) 		baswap(&src_baswapped, &bt->src);
> 256a06c8 (Masatake YAMATO    2012-07-26  587) 		baswap(&dst_baswapped, &bt->dst);
> 256a06c8 (Masatake YAMATO    2012-07-26  588) 
> 256a06c8 (Masatake YAMATO    2012-07-26  589) 		seq_printf(seq, "%pK %-6d %-6u %-6u %-6u %-6lu %pM %pM %-6lu",
> 256a06c8 (Masatake YAMATO    2012-07-26  590) 			   sk,
> 256a06c8 (Masatake YAMATO    2012-07-26  591) 			   atomic_read(&sk->sk_refcnt),
> 256a06c8 (Masatake YAMATO    2012-07-26  592) 			   sk_rmem_alloc_get(sk),
> 256a06c8 (Masatake YAMATO    2012-07-26  593) 			   sk_wmem_alloc_get(sk),
> 256a06c8 (Masatake YAMATO    2012-07-26  594) 			   sock_i_uid(sk),
> 256a06c8 (Masatake YAMATO    2012-07-26  595) 			   sock_i_ino(sk),
> 256a06c8 (Masatake YAMATO    2012-07-26  596) 			   &src_baswapped,
> 256a06c8 (Masatake YAMATO    2012-07-26  597) 			   &dst_baswapped,
> 256a06c8 (Masatake YAMATO    2012-07-26 @598) 			   bt->parent? sock_i_ino(bt->parent): 0LU);
> 256a06c8 (Masatake YAMATO    2012-07-26  599) 
>
> The code at line 598 was first introduced by commit:
> 256a06c Bluetooth: /proc/net/ entries for bluetooth protocols
>
> ---
> 0-DAY kernel build testing backend         Open Source Technology Center
> Fengguang Wu, Yuanhan Liu                              Intel Corporation

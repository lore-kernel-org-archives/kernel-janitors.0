From: Arnaldo Carvalho de Melo <acme@conectiva.com.br>
Date: Fri, 02 Apr 2004 03:34:13 +0000
Subject: Re: [Kernel-janitors] [announce] 2.6.5-rc3-kj1 patchset
Message-Id: <20040402033412.GE29457@conectiva.com.br>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040401172617.09e52deb.rddunlap@osdl.org>
In-Reply-To: <20040401172617.09e52deb.rddunlap@osdl.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Keep it up Randy!

Em Thu, Apr 01, 2004 at 05:26:17PM -0800, Randy.Dunlap escreveu:
> 
> add/	eth1394_kmemcc.patch
> 	From: <WHarms@bfs.de>(Walter Harms)

Walter, while you're working at 1394 stuff, please take a look at
drivers/ieee1394/ieee1394_core.c, specially at the ieee1394_init function,
I think you'll find some stuff to fix 8) look, for instance, at the
duplicate calls to devfs_mk_dir, at the error path, etc.

- Arnaldo
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

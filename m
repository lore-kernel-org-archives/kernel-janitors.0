From: "Stephen Biggs" <yrgrknmxpzlk@gawab.com>
Date: Wed, 09 Mar 2005 06:49:45 +0000
Subject: Re: [KJ] [PATCH] drivers/isdn/i4l/isdn_v110.c : fix warning
Message-Id: <422EB8A9.11983.C70EF@localhost>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============11409153125970373=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050308115618.GY9952@rhum.iomeda.fr>
In-Reply-To: <20050308115618.GY9952@rhum.iomeda.fr>
To: kernel-janitors@vger.kernel.org

--===============11409153125970373==
Content-type: text/plain; charset=US-ASCII
Content-transfer-encoding: 7BIT
Content-description: Mail message body

I submitted just this patch (as part of a complete warning cleanup in 
the drivers/isdn/i4l/* directory on 15 Feb 2005:
http://lists.osdl.org/pipermail/kernel-janitors/2005-February/003536.html

On 8 Mar 2005 at 12:56, Christophe Lucas wrote:

> Description:
> Fix compile warning on drivers/isdn/i4l/isdn_v110.c
> 
> 
> It refers to:
> http://developer.osdl.org/cherry/compile/2.6/linux-2.6.11.results/2.6.11.allyesconfig.bzImage.txt
> drivers/isdn/i4l/isdn_v110.c: In function `isdn_v110_stat_callback': 
> drivers/isdn/i4l/isdn_v110.c:523: warning: 'ret' might be used uninitialized in this function
> 
> Signed-off-by: Christophe Lucas <clucas@rotomalug.org>
> 




--===============11409153125970373==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============11409153125970373==--

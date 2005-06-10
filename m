From: randy_dunlap <rdunlap@xenotime.net>
Date: Fri, 10 Jun 2005 00:34:56 +0000
Subject: Re: [KJ] [PATCH] aic7xxx/aic79xx_osm.c : kernel_thread audit return
Message-Id: <20050609173456.1ca1c162.rdunlap@xenotime.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============49897620578053425=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050608082510.GB15627@rhum.iomeda.fr>
In-Reply-To: <20050608082510.GB15627@rhum.iomeda.fr>
To: kernel-janitors@vger.kernel.org

--===============49897620578053425==
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 8 Jun 2005 10:25:10 +0200 Christophe Lucas wrote:

| Perhaps, I am wrong, but I think here return code must be negative.
| Here, ahd->platform_data->dv_pid is negative and we return postive
| value. The return of this function is always tested agains 0, but ...
| 
| If I say mistake, I will be happy to know where I am wrong.
| 
| description:
| audit kernel_thread() return code.


There's no absolute requirement that (error) return codes be
negative ... it's highly desirable.  This particular driver
mostly uses positive non-zero error codes instead of negative
ones.  :(
(along with () around return values and other non-Linux style)

---
~Randy

--===============49897620578053425==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============49897620578053425==--

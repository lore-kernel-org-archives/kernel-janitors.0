From: walter harms <wharms@bfs.de>
Date: Fri, 11 Feb 2005 14:51:30 +0000
Subject: Re: [KJ] [PATCH] Reduction of compile warnings (Warning: long post
Message-Id: <420CC672.8090005@bfs.de>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============54406003751798115=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <420953CC.2707.A99E9B@localhost>
In-Reply-To: <420953CC.2707.A99E9B@localhost>
To: kernel-janitors@vger.kernel.org

--===============54406003751798115==
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit



i tried to say it a bit more diplomatic :)


Christoph Hellwig wrote:
> On Fri, Feb 11, 2005 at 02:45:20PM +0100, walter harms wrote:
> 
>>void __iomem *)ioaddr->feature_addr);
> 
> 
> this bit looks very wrong.  What type is ioaddr->feature_addr?  It really
> should be a pointer to <whatever> __iomem and not cast would be needed.
> 
> 
> 

--===============54406003751798115==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============54406003751798115==--

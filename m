From: walter harms <wharms@bfs.de>
Date: Fri, 11 Feb 2005 13:45:20 +0000
Subject: Re: [KJ] [PATCH] Reduction of compile warnings (Warning: long post
Message-Id: <420CB6F0.6090604@bfs.de>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============6275696013563572=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <420953CC.2707.A99E9B@localhost>
In-Reply-To: <420953CC.2707.A99E9B@localhost>
To: kernel-janitors@vger.kernel.org

--===============6275696013563572==
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

just my two cents ...
recruting helper variables will reduce linelenght and (sometimes) 
improve readability.

e.g.:

feature=tf->feature | (((u16)tf->hob_feature) << 8 ;

writew(feature,(volatile void __iomem *)ioaddr->feature_addr);


btw:
is 'volatile' usefull here ? i would exspect that *ioaddr->feature_addr
is already defined 'volatile'.
( i do not have the code here, sorry if its to trivial.)

re,
	walter



4.  		writew(tf->feature | (((u16)tf->hob_feature) << 8), (volatile
void __iomem *)ioaddr->feature_addr);

This line (and others) is just too long.  Split it up at the comma
between the first & second parameters and then indent the second
line.


-- 
~Randy
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors




--===============6275696013563572==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============6275696013563572==--

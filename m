From: Matthew Wilcox <willy@debian.org>
Date: Fri, 13 Aug 2004 11:47:00 +0000
Subject: Re: [Kernel-janitors] linux-2.6.7: ddp.c fix init
Message-Id: <20040813114700.GJ12936@parcelfarce.linux.theplanet.co.uk>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============45985653462661868=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============45985653462661868==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Aug 13, 2004 at 01:52:15PM +0200, Walter Harms wrote:
> +	err=sock_register(&atalk_family_ops);

You're still not getting the spacing right here --

	err = sock_register(&atalk_family_ops);

-- 
"Next the statesmen will invent cheap lies, putting the blame upon 
the nation that is attacked, and every man will be glad of those
conscience-soothing falsities, and will diligently study them, and refuse
to examine any refutations of them; and thus he will by and by convince 
himself that the war is just, and will thank God for the better sleep 
he enjoys after this process of grotesque self-deception." -- Mark Twain

--===============45985653462661868==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============45985653462661868==--

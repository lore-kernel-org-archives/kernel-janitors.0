From: "Stephen Biggs" <yrgrknmxpzlk@gawab.com>
Date: Tue, 15 Feb 2005 06:35:20 +0000
Subject: Re: [KJ] [PATCH][RESUBMIT][13/ 21] drivers/scsi/sym53c8xx_2/* -
Message-Id: <4211B448.14549.FFA83@localhost>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============61043231845689117=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <42113C2D.1177.52C034@localhost>
In-Reply-To: <42113C2D.1177.52C034@localhost>
To: kernel-janitors@vger.kernel.org

--===============61043231845689117==
Content-type: text/plain; charset=US-ASCII
Content-transfer-encoding: 7BIT
Content-description: Mail message body

On 15 Feb 2005 at 2:07, Matthew Wilcox wrote:

> On Tue, Feb 15, 2005 at 12:02:53AM +0200, Stephen Biggs wrote:
> > Description: compile warning cleanup - stop compilation of unused 
> > structure member unless proper symbol is defined
> 
> I'll fix this one in a different way.  Thanks.

Not a problem.  My fix was more quick-and-dirty than anything else: that 
is, it works but might not be the optimal or best way to fix it.

> 
> -- 
> "Next the statesmen will invent cheap lies, putting the blame upon 
> the nation that is attacked, and every man will be glad of those
> conscience-soothing falsities, and will diligently study them, and refuse
> to examine any refutations of them; and thus he will by and by convince 
> himself that the war is just, and will thank God for the better sleep 
> he enjoys after this process of grotesque self-deception." -- Mark Twain
> 




--===============61043231845689117==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============61043231845689117==--

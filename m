From: Matthew Wilcox <matthew@wil.cx>
Date: Sun, 19 Dec 2004 19:47:59 +0000
Subject: Re: [KJ] janitor project: fix gcc 4 warnings
Message-Id: <20041219194759.GF7113@parcelfarce.linux.theplanet.co.uk>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============81581320936193702=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20041219190903.GA30192@muc.de>
In-Reply-To: <20041219190903.GA30192@muc.de>
To: kernel-janitors@vger.kernel.org

--===============81581320936193702==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Dec 19, 2004 at 08:09:03PM +0100, Andi Kleen wrote:
> Here's a proposed janitor project if anybody is interested:
> 
> The current gcc 4.0 snapshots include some more warnings in -Wall
> and changed some existing ones which makes a kernel compilation quite noisy. 

I think it would get more takers if people didn't have to compile a new
gcc.  If we had a list of -W... flags in older gccs that could simulate
90% of the warnings, this would make it possible for more people to work
on it.

-- 
"Next the statesmen will invent cheap lies, putting the blame upon 
the nation that is attacked, and every man will be glad of those
conscience-soothing falsities, and will diligently study them, and refuse
to examine any refutations of them; and thus he will by and by convince 
himself that the war is just, and will thank God for the better sleep 
he enjoys after this process of grotesque self-deception." -- Mark Twain

--===============81581320936193702==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============81581320936193702==--

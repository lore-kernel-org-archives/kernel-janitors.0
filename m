From: Matthew Wilcox <willy@debian.org>
Date: Tue, 08 Jun 2004 14:35:07 +0000
Subject: Re: [Kernel-janitors] [REDIFF] new.linux-2.6.7-rc2/fs/cifs/cifsfs.c
Message-Id: <20040608143507.GD31749@parcelfarce.linux.theplanet.co.uk>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============52250782307651988=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.58.0406080152230.31755@mustang.cs.nmsu.edu>
In-Reply-To: <Pine.LNX.4.58.0406080152230.31755@mustang.cs.nmsu.edu>
To: kernel-janitors@vger.kernel.org

--===============52250782307651988==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 08, 2004 at 08:27:12AM -0600, MJK wrote:
> 	No, I didn't. No CIFS volumes to mount. mkfs didn't seem to be
> able to anyways. I guess that's my problem: no hardware to test anything
> out and only one machine to do it on. Maybe one day that'll change.

CIFS is a network filesystem.  You only need a Samba server and you can
test on the same box.

-- 
"Next the statesmen will invent cheap lies, putting the blame upon 
the nation that is attacked, and every man will be glad of those
conscience-soothing falsities, and will diligently study them, and refuse
to examine any refutations of them; and thus he will by and by convince 
himself that the war is just, and will thank God for the better sleep 
he enjoys after this process of grotesque self-deception." -- Mark Twain

--===============52250782307651988==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============52250782307651988==--

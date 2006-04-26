From: Adrian Bunk <bunk@stusta.de>
Date: Wed, 26 Apr 2006 16:26:06 +0000
Subject: Re: [KJ] Automating kernel regression detection
Message-Id: <20060426162606.GB3570@stusta.de>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============76275941325032059=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <OF731507F4.A2EFB236-ON8725715C.00518671-8625715C.0051FDE7@us.ibm.com>
In-Reply-To: <OF731507F4.A2EFB236-ON8725715C.00518671-8625715C.0051FDE7@us.ibm.com>
To: kernel-janitors@vger.kernel.org

--===============76275941325032059==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Apr 26, 2006 at 09:57:36AM -0500, James Kenefick wrote:

> Hi 

Hi James,

>    I was hoping I could get some members of this community to take
> a look at a project which identifies which kernel patch, in a set of 
> patches
> introduces a regression into the source tree, and provide feedback to
> the team developing the tool.
> 
> The tool is called PyReT and can be found at http://pyret.sf.net
> 
> Feedback can be provided directly to the project team via their
> mailing list.

my first impression is your project is a big design document with a big 
architecture searching for use cases...

There are already people doing regular LTP runs, there are people doing 
regular compile tests, and much more.

The big problem with kernel bugs is the manual work for debugging them, 
not the few steps required with the existing tools to bisect patches or 
git trees.

> thanks for your time
>   -James

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


--===============76275941325032059==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============76275941325032059==--

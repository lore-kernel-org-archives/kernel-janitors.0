From: Tony Breeds <tony@bakeyournoodle.com>
Date: Sat, 27 Aug 2005 23:52:57 +0000
Subject: Re: [KJ] [PATCH] rio: bring prototypes to the new century
Message-Id: <20050827235257.GJ1830@bakeyournoodle.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============51155092481385767=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050827213036.GA481@mipter.zuzino.mipt.ru>
In-Reply-To: <20050827213036.GA481@mipter.zuzino.mipt.ru>
To: kernel-janitors@vger.kernel.org

--===============51155092481385767==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Aug 28, 2005 at 01:30:36AM +0400, Alexey Dobriyan wrote:
> Signed-off-by: Alexey Dobriyan <adobriyan@gmail.com>
> ---
> 
>  drivers/char/rio/rioboot.c  |   25 ++------------
>  drivers/char/rio/rioctrl.c  |   12 +-----
>  drivers/char/rio/rioinit.c  |   78 ++++++++++----------------------------------
>  drivers/char/rio/riointr.c  |   18 ++--------
>  drivers/char/rio/rioparam.c |   24 +++----------
>  drivers/char/rio/rioroute.c |   35 ++++---------------
>  drivers/char/rio/riotable.c |   19 ++--------
>  drivers/char/rio/riotty.c   |   14 +------
>  8 files changed, 51 insertions(+), 174 deletions(-)

Has Roger seen this?
I showed him sonething similar a while ago and he explained that the rio
drivers are shared accross several OS's.  The only part of the code base
that differs should be in rio_linux.*

Still times change, he may be happy to do this now.


Yours Tony

   linux.conf.au       http://linux.conf.au/ || http://lca2006.linux.org.au/
   Jan 23-28 2006      The Australian Linux Technical Conference!


--===============51155092481385767==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============51155092481385767==--

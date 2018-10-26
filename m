From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 26 Oct 2018 18:53:50 +0000
Subject: Re: [PATCH] Documentation: fix spelling mistake, EACCESS -> EACCES
Message-Id: <CANiq72m-2FU7ioqj9sqsfWk4nSp2FO9S_8kYcbnGReXNAXYM2w@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181026172549.3628-1-colin.king@canonical.com>
 <CANiq72nFZS=3KGaQpGjRbprh8HTBiTcSpxScE2uacDmg-xqDGA@mail.gmail.com> <20181026184009.GV25444@bombadil.infradead.org>
In-Reply-To: <20181026184009.GV25444@bombadil.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Matthew Wilcox <willy@infradead.org>
Cc: colin.king@canonical.com, jk@ozlabs.org, Jonathan Corbet <corbet@lwn.net>, Dave Airlie <airlied@linux.ie>, maarten.lankhorst@linux.intel.com, maxime.ripard@bootlin.com, sean@poorly.run, linuxppc-dev@lists.ozlabs.org, Linux Doc Mailing List <linux-doc@vger.kernel.org>, kernel-janitors@vger.kernel.org, linux-kernel <linux-kernel@vger.kernel.org>

On Fri, Oct 26, 2018 at 8:40 PM Matthew Wilcox <willy@infradead.org> wrote:
>
> On Fri, Oct 26, 2018 at 08:20:12PM +0200, Miguel Ojeda wrote:
> > On Fri, Oct 26, 2018 at 7:27 PM Colin King <colin.king@canonical.com> wrote:
> > >
> > > From: Colin Ian King <colin.king@canonical.com>
> > >
> > > Trivial fix to a spelling mistake of the error access name EACCESS,
> > > rename to EACCES
> >
> > ? It is not a typo, it is the name of the error (POSIX). Same thing
> > for the rest of the patches.
>
> Are you sure?  From open(2):
>
>        EACCES The  requested access to the file is not allowed, or search per‐
>               mission is denied for one of the directories in the path  prefix
>               of  pathname,  or the file did not exist yet and write access to
>               the parent directory is not  allowed.   (See  also  path_resolu‐
>               tion(7).)
>
> include/uapi/asm-generic/errno-base.h:#define   EACCES          13      /* Permission denied */

I thought you were doing the reverse change. Never mind! :-)

(Btw, the POSIX reference is
http://pubs.opengroup.org/onlinepubs/9699919799/basedefs/errno.h.html#tag_13_09,
in case you want to include it or are curious)

Cheers,
Miguel

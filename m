From: Julia Lawall <julia@diku.dk>
Date: Thu, 23 Sep 2010 15:58:39 +0000
Subject: Re: threaded patch series
Message-Id: <Pine.LNX.4.64.1009231757090.11585@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <AANLkTikkJNwF4LS9rx5=bHM2R0Pm751Y1u9V8iAt0w1A@mail.gmail.com>
In-Reply-To: <AANLkTikkJNwF4LS9rx5=bHM2R0Pm751Y1u9V8iAt0w1A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Thu, 23 Sep 2010, Joe Perches wrote:

> On Thu, 2010-09-23 at 16:00 +0400, Vasiliy Kulikov wrote:
> > On Thu, Sep 23, 2010 at 13:09 +0400, Vasiliy Kulikov wrote:
> > > On Thu, Sep 23, 2010 at 10:55 +0200, Julia Lawall wrote:
> > > > I made some changes to git-send-email to get it to send mail to different 
> > > > people, ie a different set of addresses for each patch.  Is that now 
> > > > possible with the standard version?  If not I can submit a patch with my 
> > > > changes at some point.
> > > I use git-send-email --cc-cmd=script_to_form_cc_list.
> 
> I believe that Julia means some mechanism to vary the
> "to" addresses for each patch, ie: some "--to-cmd=cmd".

Yes, sort of.  I took the strategy of precomputing the To addresses, so I 
just have a collection of files that have different To and Cc addresses.  
But a --to-cmd option seems like a good idea too.

julia


> > I mean this:
> > for f in *.patch; do
> >     CMD="script_to_form_cc_list $f"
> >     git-send-email --cc-cmd="$CMD" ... "$f"
> > done
> 
> You could also do that with a single line as the target
> cc-cmd receives each $f as argument.
> 
> git send-email --cc-cmd=script_to_form_cc_list ... *.patch
> 
> 
> 

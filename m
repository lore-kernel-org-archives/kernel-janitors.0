From: Vasiliy Kulikov <segooon@gmail.com>
Date: Thu, 23 Sep 2010 12:00:24 +0000
Subject: Re: threaded patch series
Message-Id: <20100923120024.GA26715@albatros>
List-Id: <kernel-janitors.vger.kernel.org>
References: <AANLkTikkJNwF4LS9rx5=bHM2R0Pm751Y1u9V8iAt0w1A@mail.gmail.com>
In-Reply-To: <AANLkTikkJNwF4LS9rx5=bHM2R0Pm751Y1u9V8iAt0w1A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Thu, Sep 23, 2010 at 13:09 +0400, Vasiliy Kulikov wrote:
> On Thu, Sep 23, 2010 at 10:55 +0200, Julia Lawall wrote:
> > I made some changes to git-send-email to get it to send mail to different 
> > people, ie a different set of addresses for each patch.  Is that now 
> > possible with the standard version?  If not I can submit a patch with my 
> > changes at some point.
> 
> I use git-send-email --cc-cmd=script_to_form_cc_list.

I mean this:

for f in *.patch; do
    CMD="script_to_form_cc_list $f"
    git-send-email --cc-cmd="$CMD" ... "$f"
done

-- 
Vasiliy

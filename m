From: Al Viro <viro@ZenIV.linux.org.uk>
Date: Thu, 16 Apr 2009 09:16:54 +0000
Subject: Re: [PATCH 05/56] block: Remove void casts
Message-Id: <20090416091654.GZ26366@ZenIV.linux.org.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1239189748-11703-6-git-send-email-jwjstone@fastmail.fm>
In-Reply-To: <1239189748-11703-6-git-send-email-jwjstone@fastmail.fm>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sat, Apr 11, 2009 at 02:55:32PM +0200, walter harms wrote:
> 
> 
> Al Viro schrieb:
> > On Wed, Apr 08, 2009 at 01:31:43PM +0200, Bert Wesarg wrote:
> >> If typeof(c) = CommandList_struct*, that you could replace
> >> sizeof(CommandList_struct) with sizeof(*c) to make the expression
> >> shorter and fit into one line.
> > 
> > This is not commonly accepted as a good thing.  In particular, I would
> > seriously ask you to avoid doing anything of that kind around fs/*
> 
> just for the curious ...
> What is the dark side of replacing ?
> foo=malloc(sizeof(struct fo)) -> foo=malloc(sizeof( *foo) ))

The latter is ungreppable.

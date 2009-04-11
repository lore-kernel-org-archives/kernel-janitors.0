From: walter harms <wharms@bfs.de>
Date: Sat, 11 Apr 2009 12:55:32 +0000
Subject: Re: [PATCH 05/56] block: Remove void casts
Message-Id: <49E09344.80206@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1239189748-11703-6-git-send-email-jwjstone@fastmail.fm>
In-Reply-To: <1239189748-11703-6-git-send-email-jwjstone@fastmail.fm>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org



Al Viro schrieb:
> On Wed, Apr 08, 2009 at 01:31:43PM +0200, Bert Wesarg wrote:
>> If typeof(c) = CommandList_struct*, that you could replace
>> sizeof(CommandList_struct) with sizeof(*c) to make the expression
>> shorter and fit into one line.
> 
> This is not commonly accepted as a good thing.  In particular, I would
> seriously ask you to avoid doing anything of that kind around fs/*

just for the curious ...
What is the dark side of replacing ?
foo=malloc(sizeof(struct fo)) -> foo=malloc(sizeof( *foo) ))

re,
 wh

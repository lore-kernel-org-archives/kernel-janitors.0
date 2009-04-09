From: Al Viro <viro@ZenIV.linux.org.uk>
Date: Thu, 09 Apr 2009 21:08:12 +0000
Subject: Re: [PATCH 05/56] block: Remove void casts
Message-Id: <20090409210812.GJ26366@ZenIV.linux.org.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1239189748-11703-1-git-send-email-jwjstone@fastmail.fm> <1239189748-11703-2-git-send-email-jwjstone@fastmail.fm> <1239189748-11703-3-git-send-email-jwjstone@fastmail.fm> <1239189748-11703-4-git-send-email-jwjstone@fastmail.fm> <1239189748-11703-5-git-send-email-jwjstone@fastmail.fm> <1239189748-11703-6-git-send-email-jwjstone@fastmail.fm> <36ca99e90904080431o3fae1c2es555327578ab06d7@mail.gmail.com>
In-Reply-To: <36ca99e90904080431o3fae1c2es555327578ab06d7@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bert Wesarg <bert.wesarg@googlemail.com>
Cc: Jack Stone <jwjstone@fastmail.fm>, linux-kernel@vger.kernel.org, jeff@garzik.org, kernel-janitors@vger.kernel.org

On Wed, Apr 08, 2009 at 01:31:43PM +0200, Bert Wesarg wrote:
> If typeof(c) = CommandList_struct*, that you could replace
> sizeof(CommandList_struct) with sizeof(*c) to make the expression
> shorter and fit into one line.

This is not commonly accepted as a good thing.  In particular, I would
seriously ask you to avoid doing anything of that kind around fs/*

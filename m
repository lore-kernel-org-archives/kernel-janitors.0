From: Al Viro <viro@ZenIV.linux.org.uk>
Date: Fri, 27 Feb 2009 01:28:37 +0000
Subject: Re: [PATCH 11/16] fs/super.c: fix sparse warning: Using plain
Message-Id: <20090227012837.GQ28946@ZenIV.linux.org.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20090221235706.17557.97714.stgit@vmbox.hanneseder.net> <20090222000459.17557.20005.stgit@vmbox.hanneseder.net> <154e089b0902261710ybebe696p2c87334b29bf08a0@mail.gmail.com>
In-Reply-To: <154e089b0902261710ybebe696p2c87334b29bf08a0@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hannes Eder <hannes@hanneseder.net>
Cc: trivial@kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, Feb 27, 2009 at 02:10:14AM +0100, Hannes Eder wrote:
> [Added To]
> 
> On Sun, Feb 22, 2009 at 1:05 AM, Hannes Eder <hannes@hanneseder.net> wrote:
> > Fix this sparse warning:
> > ?fs/super.c:849:26: warning: Using plain integer as NULL pointer

May I suggest a better subject for those?  Namely,

Subject: NULL noise: <filename or glob>

Nobody _cares_ which tool generates that and boilerplates in subjects should
be as short as possible.

From: Stefan Richter <stefanr@s5r6.in-berlin.de>
Date: Wed, 18 Feb 2009 17:17:17 +0000
Subject: Re: [PATCH] Replace deprecated __initcall with device_initcall and
Message-Id: <499C429D.1000406@s5r6.in-berlin.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <ea11fea30902160824l22b10dcblc89c718015e156c8@mail.gmail.com>
In-Reply-To: <ea11fea30902160824l22b10dcblc89c718015e156c8@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Manish Katiyar wrote:
> On Wed, Feb 18, 2009 at 9:53 PM, Sam Ravnborg <sam@ravnborg.org> wrote:
>> On Wed, Feb 18, 2009 at 08:49:21PM +0530, Manish Katiyar wrote:
>>> I am bit confused, apparently it looks like change in comments is
>>> causing md5sum to change. See the output below.
>> Thats because your change add an extra line. And __LINE__ is used
>> by BUG_ON later in the file - so now it sees a new line numbers
>> and thus md5 sum changes.
> 
> Ohhh.......thanks a lot Sam, I would have never guessed that. Till now
> I always felt comments are harmless. In that case should I split them
> in a separate patch even if they are just simple changes in comments ?

Such a split makes only sense in larger patches where the md5sum check
helps easing the mind of reviewers.  A flood of trivial patches is not
very welcome either.

BTW, if you start adjusting the style of comments in this file, then I
suggest you change all multi-line comments to the canonical style in one
go.  Replacing one style deviation by another deviation like in
<ea11fea30902180719w34e5597ufdeb25bcb183e301@mail.gmail.com> doesn't
make sense.
-- 
Stefan Richter
-===-=--= --=- =--=-
http://arcgraph.de/sr/

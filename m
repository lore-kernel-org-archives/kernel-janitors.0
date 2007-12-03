From: Roel Kluin <12o3l@tiscali.nl>
Date: Mon, 03 Dec 2007 00:20:20 +0000
Subject: if(function()) BUG(); still bad?
Message-Id: <47534BC4.1020701@tiscali.nl>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On the kernel janitors site it is stated:

make sure BUG() is used correctly (i.e. if(function()) BUG(); is evil)
    * i.e. even when no-op-ing BUG we still have an if (See also: BUG_ON)

Is this still true? A recent patch added such entries, see for instance
http://lkml.org/lkml/2007/11/30/298 There are also several occurances in the
kernel, which can be spotted with:

[begin bash]

s="[[:space:]]*";
V="[[:alpha:]_]\+[[:alnum:]_]*"

# a bit of magic to cope with comments, chars and strings
cendl="$s\(\/[\*\/].*\)\?$"
ccode="\([^\/\"']*\|\/[^\*\/]\|\/\*.*\*\/\|'[^']*'\|\"[^\"]*\"\)*"

q="${s}if$s($ccode$s$V$s($ccode)$s$ccode$s)"

git-grep -n -B1 "^\($q\)\?${s}BUG($s)$s;$cendl" | grep -A1 "$q$cendl" | less

[end bash]

There are a few false positives due to sizeof() and MACROS(), but I can think of
a way to filter those as well.

for instance in a patch I saw this:

> +		if (__blk_end_request(rq, 0, 0))
> +			BUG();
>  		spin_unlock(q->queue_lock);

If it's still bad, what should the fix be? (I'll write a script and post
patches)

Roel



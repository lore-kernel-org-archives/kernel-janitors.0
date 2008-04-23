From: Roel Kluin <12o3l@tiscali.nl>
Date: Wed, 23 Apr 2008 09:30:22 +0000
Subject: Re: script to find incorrect tests on unsigneds
Message-Id: <480F01AE.1030507@tiscali.nl>
List-Id: <kernel-janitors.vger.kernel.org>
References: <4808C90A.5040600@tiscali.nl>
In-Reply-To: <4808C90A.5040600@tiscali.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Forgot to add these on top of my script,

int="[0-9]"
hEx="[A-Fa-f0-9]"
an_="[A-Za-z0-9_]"
D="$int*\.\?$int\+x\?$hEx*[uUlL]\{0,3\}[fF]\?"
V="$an_\+$an_*"
w="\($V\|${V}\[$s$an_*${s}\]\|$V\.\|$V->\)\+"
s="[[:space:]]*";
S="[[:space:]]\+"
cendl="$s\(\/[\*\/].*\)\?$"

Roel

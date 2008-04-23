From: Roel Kluin <12o3l@tiscali.nl>
Date: Wed, 23 Apr 2008 16:01:30 +0000
Subject: Re: script to find incorrect tests on unsigneds
Message-Id: <480F5D5A.9040105@tiscali.nl>
List-Id: <kernel-janitors.vger.kernel.org>
References: <4808C90A.5040600@tiscali.nl>
In-Reply-To: <4808C90A.5040600@tiscali.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

ok I tested it and these are in fact correct:

* i = -C
* i != -C

Also correct when someone fears that 'i' may become signed in the future:
* i <= 0
* i >= 0

But the latter, does not make sense when used as a test in a for or while
loop. Also an else branch indicates a signed assumption.

So the spatch could contain for the basic matches:

(
* i < 0
|
* i < -C
|
* i > -C
|
* i <= -C
|
* i >= -C
)

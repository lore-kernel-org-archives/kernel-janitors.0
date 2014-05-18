From: Andi Kleen <andi@firstfloor.org>
Date: Sun, 18 May 2014 05:04:35 +0000
Subject: Re: [PATCH RFC] Remove useless return variables
Message-Id: <87y4xzpti4.fsf@tassilo.jf.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1400379310-10214-1-git-send-email-peter.senna@gmail.com>
In-Reply-To: <1400379310-10214-1-git-send-email-peter.senna@gmail.com> (Peter
	Senna Tschudin's message of "Sun, 18 May 2014 04:15:10 +0200")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernelnewbies@lists.kernelnewbies.org

Peter Senna Tschudin <peter.senna@gmail.com> writes:

> This patch remove variables that are initialized with a constant,
> are never updated, and are only used as parameter of return.
> Return the constant instead of using a variable.

This ret variable pattern is pretty standard in Linux, as it makes it 
easier to add new code that may trigger new errors
(using the usual "goto forest" error handling pattern)

I don't see any benefit in whole-sale removing it. The compiler
doesn't care about it and will generate the same code in any 
case.

-Andi

-- 
ak@linux.intel.com -- Speaking for myself only

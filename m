From: Julia Lawall <julia@diku.dk>
Date: Sun, 16 May 2010 08:58:52 +0000
Subject: ERR_PTR and PTR_ERR
Message-Id: <Pine.LNX.4.64.1005161055580.6573@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

I see a number of occurrences of code like the following:

 	if (IS_ERR(alg))
		return ERR_PTR(PTR_ERR(alg));

Is there any reason why the second line couldn't just be return alg?

julia

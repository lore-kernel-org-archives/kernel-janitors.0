From: Nicholas Mc Guire <der.herr@hofr.at>
Date: Mon, 16 Dec 2013 17:19:42 +0000
Subject: [PATCH 0/6] API consolidation spin_lock/spin_unlock to spin_unlock_wait
Message-Id: <20131216171942.GA15665@opentech.at>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi !

This patch set proposes a small API consolidation. 
replacing:
	spin_lock(lock);
	spin_unlock(lock);
by:
	spin_unlock_wait(lock);
in a number of locations.

patch and compile testing is against linux-next 3.13.0-rc4 (git pull today)

thx!
hofrat

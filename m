From: Alexander Beregalov <a.beregalov@gmail.com>
Date: Tue, 29 Jul 2008 19:17:38 +0000
Subject: How to fix warning 'control reaches end of non-void function'
Message-Id: <20080729191738.GA32506@orion>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi

What is it a right way to fix these warnings?

smth function()
{
	switch (var) {
	case one:
		return 1;
	default:
		BUG();
	}
}

warning: control reaches end of non-void function

Thanks!	
	

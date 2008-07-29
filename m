From: Rene Herman <rene.herman@keyaccess.nl>
Date: Tue, 29 Jul 2008 22:38:46 +0000
Subject: Re: How to fix warning 'control reaches end of non-void function'
Message-Id: <488F9BF6.9040500@keyaccess.nl>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20080729191738.GA32506@orion>
In-Reply-To: <20080729191738.GA32506@orion>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 29-07-08 21:17, Alexander Beregalov wrote:

> What is it a right way to fix these warnings?
> 
> smth function()
> {
> 	switch (var) {
> 	case one:
> 		return 1;
> 	default:
> 		BUG();
> 	}
> }
> 
> warning: control reaches end of non-void function

BUG() may actually do nothing so I'd just reorder things around as

int function(void)
{
	switch (var) {
	case 1:
		break;
	default:
		BUG();
	}
	return 1;
}

Rene.

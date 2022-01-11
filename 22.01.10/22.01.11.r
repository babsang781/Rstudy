# github ���� ��ġ
install.packages("remotes")
library(remotes)

# KoNLP ��ġ
remotes::install_github('haven-jeon/KoNLP', upgrade = "never", INSTALL_opts=c("--no-multiarch"))

# ��Ű�� �ε��ϱ�
library(KoNLP)
# Checking user defined dictionary!  # �� �޽����� �߸� ����!


v1 <- "��¦�̴� ������
�����̴� �� ���� �ǹ�
�츰 ������ �ֳ�
������ �� ������ ������ (eh oh)
� ���� �߸�
� ���� ��Ȳ
������� �Һ���
��� ������ �ϳ�
��ο� �� (�ܷο� ��)
��ó�� �� (�츰 ����)
������� ��
ū ����ϱ�
Let us shine
���� �� ���� ǥ���� ����� �� �Ƹ��ٿ� ��
Oh �� ���鵵 �Һ��� �ƴ� �츮 ������ �ž�
You got me
�� �ʸ� ���� ���� ��
I got you
ĥ�� ���� ��� ��
���ΰ� �� ������ ��
���� ���� �ϰ� �־��� �ž� �츰
���� ���� �㿡 �� ������ ���� (oh oh oh oh, oh oh oh, oh oh oh oh)
���� ���� �㿡 �� ������ ���� (oh oh oh oh, oh oh oh, oh oh oh oh)
���� �������� �� ������ ����
�� ����� �ϳ��� ����
�� ����� �ϳ��� ��
70�� ���� ������ ������
70�� ������ world
70�� ������ �� ������ �߰���
��¼�� �� �ٸ� ������ ��
���ڸ��� �� let us shine
�� �������� ��� ����
One
���� �� ���� ǥ���� ����� �� �Ƹ��ٿ� ��
Oh �� ��ҵ� �޺��� �ƴ� �츮 ������ �ž�
You got me
�� �ʸ� ���� ���� ��
I got you
ĥ�� ���� ��� ��
���ΰ� �� ������ ��
���� ���� �ϰ� �־��� �ž� �츰
���� ���� �㿡 �� ������ ���� (oh oh oh oh, oh oh oh, oh oh oh oh)
���� ���� �㿡 �� ������ ���� (oh oh oh oh, oh oh oh, oh oh oh oh)
���� �������� �� ������ ����
������ ��, �� ������ ��
� �� �÷��� ���ϴ��� �� ���÷�
����̶� ��, ����̶� ���� ������ �ٷ� �� ������
We shinin'
You got me
�� �ʸ� ���� ���� ����
I got you
ĥ�� ���� ��� �ӿ�
Shine, dream, smile (shine, yeah)
Oh let us light up the night
�츰 �츮��� ���� ((oh oh oh oh, oh oh oh)
Shine, dream, smile
Oh let us light up the night
�츮 �� ��ü�� ����
Tonight"

extractNoun(v1)

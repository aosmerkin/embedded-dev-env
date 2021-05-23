# Command to build image
# $ docker build -f ./Dockerfile -t embedded-dev-env .

FROM ubuntu:focal

ARG developer_user_id
ARG developer_group_id

# This is needed for successful automatic configuration of
# tzdata package when it is installed later
RUN ln -s /usr/share/zoneinfo/Etc/UTC /etc/localtime

# Install all required packages
RUN apt-get update -y && \
    apt-get install -y \
        autoconf automake bison bzip2 cmake flex g++ gawk gcc gettext \
        git gperf help2man libncurses5-dev libstdc++6 libtool libtool-bin \
        make patch python3-dev rsync texinfo unzip wget xz-utils && \
    apt-get clean

# Add developer user for better integration with IDEs (e.g. VSCode)
RUN groupadd -g ${developer_group_id} developer && \
    useradd -m -u ${developer_user_id} -g ${developer_group_id} developer

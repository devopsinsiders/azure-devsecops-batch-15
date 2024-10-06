FROM nginx
# RUN rm /usr/share/nginx/html/index.html
# RUN echo "I am Dhondhu!" > /usr/share/nginx/html/index.html
# COPY index.html /usr/share/nginx/html/
ADD --chmod=777 https://raw.githubusercontent.com/devopsinsiders/azure-devsecops-batch-15/main/CodeSamples/index.html /usr/share/nginx/html/

RUN rm /usr/share/nginx/html/index.html